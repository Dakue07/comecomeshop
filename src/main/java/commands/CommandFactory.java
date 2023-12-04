package commands;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import context.RequestContext;

public class CommandFactory {
	@SuppressWarnings({ "deprecation", "finally" })
	public static AbstractCommand getCommand(RequestContext rc, InputStream file) {
		AbstractCommand command = null;
		Properties prop = new Properties();
		
		try {
			prop.load(file);
			String name = prop.getProperty(rc.getCommandPath());
			System.out.println("こまふぁく" + name);
			Class<?> c = Class.forName(name);
			command = (AbstractCommand) c.getDeclaredConstructor().newInstance();
			
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
