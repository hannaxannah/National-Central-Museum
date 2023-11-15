package museum;

import java.util.ArrayList;

import admin.ShopDAO;
import admin.ShopDTO;

public class CartDTO {

	private ArrayList<ShopDTO> clist;
	
	public CartDTO() {
		clist = new ArrayList<ShopDTO>();
	} //CartDTO 생성자
	
	public void addGoods(String gnum, String oqty) { 
		
		//이미 장바구니에 있으면
		int gnum_new = Integer.parseInt(gnum);
		int oqty_new = Integer.parseInt(oqty);
		
		for(int i=0; i<clist.size(); i++) {
			if(clist.get(i).getGnum() == gnum_new) { 
				clist.get(i).setGqty(clist.get(i).getGqty() + oqty_new);
				return;
			}
		}
		
		//장바구니에 없으면
		ShopDAO sdao = ShopDAO.getInstance();
		ShopDTO sdto = sdao.getGoodsByNum(gnum);
		sdto.setGqty(Integer.parseInt(oqty));
		clist.add(sdto);
		System.out.println("장바구니 상품 갯수:"+clist.size());
		for(int i=0; i<clist.size(); i++) {
			System.out.println(clist.get(i).getGnum()+"/"+clist.get(i).getGqty());
		}
	} //addProduct
	
	public ArrayList<ShopDTO> getAllGoods() {
		return clist;
	} //getAllGoods
	
	public void removeGoods(String gnum) {
		
		for(int i=0; i<clist.size(); i++) {
			if(clist.get(i).getGnum() == Integer.parseInt(gnum)) {
				clist.remove(clist.get(i));
				break;
			} //if
		} //for
	} //removeProduct
	
	public void removeAllGoods() {
		clist.removeAll(clist);
	} //removeAllProduct
	
}
