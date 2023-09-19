package jstl;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class Drop extends TagSupport {
	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			out.print("hiii");
		} catch (Exception e) {
			throw new JspException(e);
		}
		return SKIP_BODY; // Indicate that the body of the tag should be skipped
	}
}
