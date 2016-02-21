package net.malta.web.app;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import net.enclosing.util.HibernateSession;
import net.malta.beans.PurchaseForm;
import net.malta.model.PublicUser;
import net.malta.model.Purchase;
import net.malta.model.PurchaseImpl;
import net.storyteller.desktop.CopyProperties;


public class PurchasesAction extends Action{
	public ActionForward execute(
			ActionMapping mapping,
			ActionForm form,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception{



		Session session = new HibernateSession().currentSession(this
				.getServlet().getServletContext());

                Vector vector = new Vector();
		Criteria criteria = session.createCriteria(Purchase.class);
                		if(StringUtils.isNotBlank(req.getParameter("datestartdate")) && StringUtils.isNotBlank(req.getParameter("dateenddate"))){
			Date  startDate = (new SimpleDateFormat("yyyy/MM/dd")).parse(req.getParameter("datestartdate"));
			Date endDate = (new SimpleDateFormat("yyyy/MM/dd")).parse(req.getParameter("dateenddate"));
			criteria.add(Restrictions.between("date", startDate, endDate));
		}


		if(StringUtils.isNotBlank(req.getParameter("publicUser"))) {
			Criteria criteria2 = session.createCriteria(PublicUser.class);
			criteria2.add(Restrictions.idEq(Integer.valueOf(req.getParameter("publicUser"))));
			PublicUser publicUser = (PublicUser) criteria2.uniqueResult();
			criteria.add(Restrictions.eq("publicUser", publicUser));
		}
		criteria.add(Restrictions.eq("temp", new Boolean(false)));
		criteria.add(Restrictions.eq("removed", new Boolean(false)));
 



		req.setAttribute("purchases",criteria.list());


//		for (Iterator iter = criteria.list().iterator(); iter.hasNext();) {
//			Purchase purchase = (Purchase) iter.next();
//			vector.add(purchase);
//		}
		Purchase purchase = new PurchaseImpl();
		PurchaseForm purchaseform = new PurchaseForm();
		criteria = session.createCriteria(Purchase.class);


		if (req.getAttribute("form")== null && req.getParameter("id")!=null){
			criteria.add(Restrictions.idEq(Integer.valueOf(req
					.getParameter("id"))));
			purchase = (Purchase) criteria.uniqueResult();
			new CopyProperties(purchase,purchaseform);
		} else if(req.getAttribute("form")!=null){
                        purchaseform = (PurchaseForm)req.getAttribute("form");
			criteria.add(Restrictions.idEq(purchaseform.getId()));
			purchase = (Purchase) criteria.uniqueResult();
		}
		

		req.setAttribute("model",purchase);
		req.setAttribute("form",purchaseform);
		
		

                if(req.getParameter("displayexport") !=null){
     		    return mapping.findForward("displayexport");
                }

		return mapping.findForward("success");
	}
	
	
}