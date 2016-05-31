/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package lavid.logger;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gtmda
 */
public class LoggerManager {
    private static LoggerManager logger = new LoggerManager();
    
    private static SimpleDateFormat formatter2 = new SimpleDateFormat("[ dd/MM/yyyy - hh:mm:ss ]");
    private File file = null;
    private BufferedWriter bw = null;

    private LoggerManager() {
        SimpleDateFormat formatter = new SimpleDateFormat("dd_MM_yyyy_hh_mm_ss");
        new File("log").mkdir();
        file = new File("./log/log" + formatter.format(new Date(System.currentTimeMillis())) + ".txt");
        try {
            bw = new BufferedWriter(new FileWriter(file));
        } catch (IOException ex) {
            ex.printStackTrace();
            Logger.getLogger(LoggerManager.class.getName()).log(Level.SEVERE, null, ex);
            System.exit(1);
        }
    }

    public static void addLog(String msg) throws IOException{
        logger.adicionarMensagem(msg);
    }

    public void adicionarMensagem(String msg) throws IOException{
        StringBuilder builder = new StringBuilder();
        builder.append(formatter2.format(new Date(System.currentTimeMillis())));
        builder.append(msg);


        bw.write(builder.toString());
        bw.newLine();
        bw.flush();
    }


}
