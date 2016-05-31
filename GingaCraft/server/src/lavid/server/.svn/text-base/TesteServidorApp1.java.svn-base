/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package lavid.server;

import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gtmda
 */
public class TesteServidorApp1 {
    public static void main(String [] args) throws IOException{
        Socket socket = new Socket("localhost", 4444);
        OutputStream outputStream = socket.getOutputStream();
        String nome = "Alexander";
        String titulo = "Teste1";
        String msg = "Opa tudo bom ? Como vão vocês ? Estou aqui testando esse aplicativo que está rodando em cima de uma figura =P";
        
        int cont = 0;
        while(true){
            String teste = "nome:" + nome + (cont++) + "titulo:" + titulo + "msgm:" + msg;
            outputStream.write(teste.getBytes());
            try {
                Thread.sleep(1000);
            } catch (InterruptedException ex) {
                Logger.getLogger(TesteServidorApp1.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        //socket.close();
    }
}
