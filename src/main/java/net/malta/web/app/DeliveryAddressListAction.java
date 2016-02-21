package net.malta.web.app;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import net.malta.model.DeliveryAddress;
import net.malta.model.json.mapper.DeliveryAddressesMapper;
import net.malta.service.user.IDeliveryAddressService;
import net.malta.web.model.PurchaseInfo;
import net.malta.web.utils.BeanUtil;
import net.malta.web.utils.JSONResponseUtil;
import net.malta.web.utils.SessionData;

public class DeliveryAddressListAction extends Action {
	@SuppressWarnings("unchecked")
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req,
			HttpServletResponse res) throws Exception {

		// DeliveryMethodUtils.setIntoSesssion(req);

		PurchaseInfo sessionPuchaseInfo = SessionData.getSessionPuchaseInfo(req);
		Integer userId = sessionPuchaseInfo.getUserId();

		IDeliveryAddressService deliveryAddressService = (IDeliveryAddressService) BeanUtil
				.getBean("deliveryAddressService", this.getServlet().getServletContext());

		List<DeliveryAddress> deliveryAddresses = deliveryAddressService.getDeliveryAddresses(userId);
		DeliveryAddressesMapper mapper = BeanUtil.getDeliveryAddressesMapper(this.getServlet().getServletContext());
		List<net.malta.model.user.json.DeliveryAddress> deliveryAddressesJson = mapper.map(deliveryAddresses,
				new ArrayList<net.malta.model.user.json.DeliveryAddress>());
		JSONResponseUtil.writeResponseAsJSON(res, deliveryAddressesJson);
		return null;
	}

}