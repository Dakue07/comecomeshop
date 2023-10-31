package commands;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import context.RequestContext;

public class CommandFactory {
	@SuppressWarnings({ "deprecation", "finally" })
	public static AbstractCommand getCommand(RequestContext rc) {
		AbstractCommand command = null;
		Properties prop = new Properties();
		
		try {
			prop.load(new FileInputStream("C:\\comecomeshop\\src\\properties\\commands.properties"));
			String name = prop.getProperty(rc.getCommandPath());
			System.out.println("こまふぁく" + name);
			Class<?> c = Class.forName(name);
			command = (AbstractCommand) c.newInstance();
			
		} catch (ClassNotFoundException |IOException e) {
			e.printStackTrace();
			command = null;
		} catch (InstantiationException e) {
			e.printStackTrace();
			command = null;
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			command = null;
		} finally {
			return command;
		}
		
	}
}
