package ctags.classes;

import java.sql.*;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class TagHandler extends TagSupport{
	
	//private Connection connection;
	private String table;
	private String displayColumn;
	private String valueColumn;
	
	
	/*public Connection getConn() {
		return connection;
	}
*/

	public String getTable() {
		return table;
	}


	public String getDisplayColumn() {
		return displayColumn;
	}


	public String getValueColumn() {
		return valueColumn;
	}


	/*public void setConn(Connection conn) {
		this.connection = conn;
	}

*/
	public void setTable(String table) {
		this.table = table;
	}


	public void setDisplayColumn(String displayColumn) {
		this.displayColumn = displayColumn;
	}


	public void setValueColumn(String valueColumn) {
		this.valueColumn = valueColumn;
	}

	@Override
    public int doStartTag() throws JspException {
        try {
            JspWriter out=pageContext.getOut();
            Class.forName("org.postgresql.Driver");
			Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","2468");
            Statement st = connection.createStatement();
            String query = "select " + displayColumn + ", " + valueColumn + " from " + table;
            ResultSet rs = st.executeQuery(query);
            
            out.print("<select>");

            while (rs.next()) {
                String displayValue = rs.getString(displayColumn);
                String optionValue = rs.getString(valueColumn);
                out.print("<option value=\"" + optionValue + "\">" + displayValue + "</option>");
            }

            out.print("</select>");

            rs.close();
            st.close();
            connection.close();

        } catch (Exception e) {
            throw new JspException(e);
        }
        return SKIP_BODY;
    }


	
}

