
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

public aspect log {
	

	    
	    Calendar cal = Calendar.getInstance();
	    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	    pointcut logReport() :call(* money*(..));
	    after() : logReport(){
	    	
	    	try {
	    		File file = new File("log.txt");
	    	    FileWriter fileW;
	    	    
	    		fileW =  new FileWriter(file);
	    		Date fecha = cal.getTime();
	    		
	    		fileW.write(fecha.toString());
	    		fileW.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
	    	
	    }
	
}
