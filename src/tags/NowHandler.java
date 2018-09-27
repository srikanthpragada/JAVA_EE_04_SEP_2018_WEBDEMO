package tags;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class NowHandler extends SimpleTagSupport {
	@Override
	public void doTag() throws JspException {
		JspWriter out = this.getJspContext().getOut();
		try {
			out.println(LocalDateTime.now()
					.format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")));
		} catch (Exception ex) {

		}
	}

}
