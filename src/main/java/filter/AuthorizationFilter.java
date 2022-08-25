package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserModel;
import utils.SessionUtil;

public class AuthorizationFilter implements Filter {

	private ServletContext svlContext;
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String uri = req.getRequestURI();
		UserModel user = (UserModel) SessionUtil.getInstance().getValue(req, "USER");
		if (uri.startsWith("/News_JDBC_Serverlet/admin")) {
			if(user!=null)
			{
				if(user.getRole().getCode().equals("ADMIN"))
				{

					chain.doFilter(request, response);
				}
				else
				{
					res.sendRedirect(req.getContextPath()+"/dang-nhap?message=not_permission");
				}
			}
			else
			{
				res.sendRedirect(req.getContextPath()+"/dang-nhap?message=not_login");
			}
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		this.svlContext = fConfig.getServletContext();
	}

}
