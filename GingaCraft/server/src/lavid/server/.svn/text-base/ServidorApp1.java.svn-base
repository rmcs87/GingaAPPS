/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lavid.server;

import java.io.IOException;
import java.io.InputStream;
import java.net.ServerSocket;
import java.net.Socket;
import javax.swing.JOptionPane;

/**
 *
 * @author gtmda
 */
public class ServidorApp1 extends Thread {

    private static Socket socketAtual = null;
    private int port;

    public ServidorApp1(int port) {
        this.port = port;
    }



    @Override
    public void run() {

        ServerSocket serverSocket = null;
        try {
            serverSocket = new ServerSocket(port);
        } catch (IOException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, "Porta 4444 ocupada.");
            System.exit(1);
        }

        while (true) {
            try {

                System.out.println("Esperando conexão na porta 4444.");
                socketAtual = serverSocket.accept();

            } catch (IOException ex) {
                ex.printStackTrace();
            }

        }
    }

    

    public String getResposta() throws IOException, InterruptedException {
        while(socketAtual == null || socketAtual.isClosed()){
            sleep(500);
        }
        
        InputStream stream = socketAtual.getInputStream();

        byte[] pacote = new byte[5000];

        stream.read(pacote);
        int indice = 0;

        for (int i = 0; i < pacote.length; i++) {
            if (pacote[i] == 0) {
                indice = i;
                break;
            }
        }

        String result = new String(pacote, 0, indice);
        return result;
    }

    public static void main(String[] args) {
        ServidorApp1 servidorApp1 = new ServidorApp1(4444);
        servidorApp1.start();
    }
}
