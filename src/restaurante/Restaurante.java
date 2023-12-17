
package restaurante;

import com.formdev.flatlaf.FlatLightLaf;


public class Restaurante {
    
    //Editar esto (datos para la conexión con la bd (La BD se debe llamar restaurante)
    public static final String URL = "";
    public static final String USERNAME = "";
    public static final String PASSWORD = "";
    
    public static void main(String[] args) {
        FlatLightLaf.setup();
        // TODO code application logic here
        Menu principal = new Menu();
        principal.setLocationRelativeTo(null);
        principal.setVisible(true);
    }
    
}
    