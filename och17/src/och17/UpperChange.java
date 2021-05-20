package och17;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
public class UpperChange extends HttpServletRequestWrapper {
	private HttpServletRequest request;
	public UpperChange(HttpServletRequest request) {
		super(request);
		this.request = request;
	}
	public String getParameter(String name) {
		String value = request.getParameter(name);
		return value.toUpperCase()+"씨";
	}
	public String[] getParameterValues(String name) {
		String[] value = request.getParameterValues(name);
		String[] newValue = new String[value.length];
		for (int i = 0; i <value.length;i++) {
			newValue[i] = value[i].toUpperCase();
		}
		return newValue;
	}
}