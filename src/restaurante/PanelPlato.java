
package restaurante;

import java.awt.Dimension;
import javax.swing.JLabel;
import javax.swing.JPanel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;
import static restaurante.Restaurante.PASSWORD;
import static restaurante.Restaurante.URL;
import static restaurante.Restaurante.USERNAME;

public class PanelPlato extends JPanel {
    
    String categoria, dia;
    int posicionY;
    int alturaPanel = 45;
    
    public PanelPlato(String dia, String categoria, int posicionY, JPanel panelTemporal) {
        setLayout(null);

        this.categoria = categoria;
        this.dia = dia;
        this.posicionY = posicionY;
        
        JLabel categoriaLabel = new JLabel(categoria);
        categoriaLabel.setFont(new java.awt.Font("sansserif", 1, 18));
        categoriaLabel.setBounds(6, 0, 220, 25);
        categoriaLabel.setVisible(true);
        
        try {
            Connection conexion = DriverManager.getConnection(URL, USERNAME, PASSWORD); // Debes implementar obtenerConexion()

            Map<Integer, Map<String, Object>> platosUnicos = obtenerPlatosPorDiaYCategoria(conexion, this.dia, this.categoria);

            int yInicial = 45;
            
            // Iterar sobre los platos únicos
            for (Map.Entry<Integer, Map<String, Object>> entry : platosUnicos.entrySet()) {
                Map<String, Object> detallesPlato = entry.getValue();

                // Acceder a los detalles del plato
                String nombre = String.valueOf(detallesPlato.get("Nombre")) ;
                String descripcion = String.valueOf(detallesPlato.get("DescripcionPlato"));
                String precio = String.valueOf(detallesPlato.get("Precio"));
                
                JLabel nombreLabel = new JLabel(nombre);
                JLabel descripcionLabel = new JLabel(descripcion);
                JLabel precioLabel = new JLabel(precio);
                
                nombreLabel.setBounds(6, yInicial, 255, 20);
                descripcionLabel.setBounds(267, yInicial, 555, 20);
                precioLabel.setBounds(824, yInicial, 45, 20);
                
                nombreLabel.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
                descripcionLabel.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
                precioLabel.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
                
                nombreLabel.setVisible(true);
                descripcionLabel.setVisible(true);
                precioLabel.setVisible(true);

                add(nombreLabel);
                add(descripcionLabel);
                add(precioLabel);
                
                panelTemporal.setSize(new Dimension(1122, (int) panelTemporal.getPreferredSize().getHeight()));

                
                repaint();
                revalidate();
                yInicial = yInicial + 30;
                alturaPanel = alturaPanel + 30;
            }

            conexion.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        setVisible(true);
        setBorder(null);
        setBounds(6, posicionY, 885, alturaPanel);
        setFocusable(true);
        setOpaque(true);
        
        add(categoriaLabel);
        
        
    }
    
    public Map<Integer, Map<String, Object>> obtenerPlatosPorDiaYCategoria(Connection conexion, String dia, String categoria) throws SQLException {
        Map<Integer, Map<String, Object>> platosUnicos = new HashMap<>();

        String consulta = "SELECT c.IdPlatos, p.Nombre, p.DescripcionPlato, p.Precio " +
                          "FROM Cartas c " +
                          "JOIN Platos p ON c.IdPlatos = p.IdPlato " +
                          "WHERE c.Dia = ? AND p.Categoria = ?";

        try (PreparedStatement preparedStatement = conexion.prepareStatement(consulta)) {
            preparedStatement.setString(1, dia);
            preparedStatement.setString(2, categoria);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int idPlato = resultSet.getInt("IdPlatos");
                    String nombre = resultSet.getString("Nombre");
                    String descripcion = resultSet.getString("DescripcionPlato");
                    double precio = resultSet.getDouble("Precio");

                    Map<String, Object> detallesPlato = new HashMap<>();
                    detallesPlato.put("Nombre", nombre);
                    detallesPlato.put("DescripcionPlato", descripcion);
                    detallesPlato.put("Precio", precio);

                    platosUnicos.put(idPlato, detallesPlato);
                }
            }
        }

        return platosUnicos;
    }
}
