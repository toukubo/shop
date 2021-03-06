package net.malta.web.app;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.malta.model.*;
import net.malta.beans.*;


import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.web.context.support.WebApplicationContextUtils;

import net.enclosing.util.HibernateSession;
import net.enclosing.util.StringFullfiller;
import net.storyteller.desktop.CopyProperties;


public class PostDeliveryAddressDetailAction extends Action{
	public ActionForward execute(
			ActionMapping mapping,
			ActionForm form,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception{
		
		Session session = new HibernateSession().currentSession(this
				.getServlet().getServletContext(),10);


		DeliveryAddress deliveryAddress = new DeliveryAddressImpl();
		DeliveryAddressForm deliveryAddressform = new DeliveryAddressForm();
		Criteria criteria = session.createCriteria(DeliveryAddress.class);

		if (req.getAttribute("form")== null && req.getParameter("id")!=null){
			criteria.add(Restrictions.idEq(Integer.valueOf(req
					.getParameter("id"))));
			deliveryAddress = (DeliveryAddress) criteria.uniqueResult();
			deliveryAddressform.setPrefecture(deliveryAddress.getPrefecture().getId());
			new CopyProperties(deliveryAddress,deliveryAddressform);
		} else if(req.getAttribute("form")!=null){
			String error = (String)req.getSession().getAttribute("error");
			req.setAttribute("error",error);
			req.getSession().setAttribute("error","");

                        deliveryAddressform = (DeliveryAddressForm)req.getAttribute("form");
			criteria.add(Restrictions.idEq(deliveryAddressform.getId()));
			deliveryAddress = (DeliveryAddress) criteria.uniqueResult();
		}
		
		StringFullfiller.fullfil(deliveryAddressform);
		
		
		req.setAttribute("model",deliveryAddress);
		req.setAttribute("form",deliveryAddressform);
		//req.setAttribute("publicUser", deliveryAddress.getPublicUser());
		if(StringUtils.isNotBlank(req.getParameter("deliverymethod"))){
			Integer deliverymethodInteger = Integer.valueOf(req.getParameter("deliverymethod"));
			req.getSession().setAttribute("deliverymethod", deliverymethodInteger);
		}


		Criteria criteriaGiftCard= session.createCriteria(GiftCard.class);
		req.setAttribute("GiftCards", criteriaGiftCard.list());

		Criteria criteriaPrefecture = session.createCriteria(Prefecture.class);
		req.setAttribute("Prefectures", criteriaPrefecture.list());
		
		return mapping.findForward("success");
	}
	
	
}