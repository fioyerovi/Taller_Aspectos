
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

public aspect log {
	

	    
	    Calendar cal = Calendar.getInstance();
	    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	    pointcut logReport() :call(* moneyMakeTransaction*(..));
	    
	    pointcut retirar():call(* moneyWithdrawal*(..));
	    
	    
	    after() : logReport(){
	    	
	    	try {
	    		File file = new File("log.txt");
	    	    FileWriter fileW;
	    	    
	    		fileW =  new FileWriter(file,true);
	    		Date fecha = cal.getTime();
	    		
	    		fileW.write("Transaccion/"+fecha.toString()+"\n");
	    		System.out.println("Ingresado la fecha");
	    		fileW.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
	    	
	    }
	    after(): retirar(){
	    	
	    	try {
	    		File file = new File("log.txt");
	    	    FileWriter fileW;
	    	    
	    		fileW =  new FileWriter(file,true);
	    		Date fecha = cal.getTime();
	    		
	    		fileW.write("Retiro/"+fecha.toString()+"\n");
	    		System.out.println("Ingresado la fechaV2");
	    		fileW.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
	    }
	
}
