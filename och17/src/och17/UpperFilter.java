package och17;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
@WebFilter("/sub3/*")
public class UpperFilter implements Filter {
	public void destroy() {	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		UpperChange uc = new UpperChange((HttpServletRequest)request);
		chain.doFilter(uc, response);
	}
	public void init(FilterConfig fConfig) throws ServletException {}
}