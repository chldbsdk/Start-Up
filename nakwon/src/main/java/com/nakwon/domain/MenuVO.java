package com.nakwon.domain;

public class MenuVO {
	private int MenuCode;
	private String MenuTitle;
	private String MenuContent;
	private String MenuImg;
	private String MenuPrice;
	private String MenuIngredients;
	private String MenuAllergy;
	@Override
	public String toString() {
		return "MenuVO [MenuCode=" + MenuCode + ", MenuTitle=" + MenuTitle + ", MenuContent=" + MenuContent
				+ ", MenuImg=" + MenuImg + ", MenuPrice=" + MenuPrice + ", MenuIngredients=" + MenuIngredients
				+ ", MenuAllergy=" + MenuAllergy + "]";
	}
	public int getMenuCode() {
		return MenuCode;
	}
	public void setMenuCode(int menuCode) {
		MenuCode = menuCode;
	}
	public String getMenuTitle() {
		return MenuTitle;
	}
	public void setMenuTitle(String menuTitle) {
		MenuTitle = menuTitle;
	}
	public String getMenuContent() {
		return MenuContent;
	}
	public void setMenuContent(String menuContent) {
		MenuContent = menuContent;
	}
	public String getMenuImg() {
		return MenuImg;
	}
	public void setMenuImg(String menuImg) {
		MenuImg = menuImg;
	}
	public String getMenuPrice() {
		return MenuPrice;
	}
	public void setMenuPrice(String menuPrice) {
		MenuPrice = menuPrice;
	}
	public String getMenuIngredients() {
		return MenuIngredients;
	}
	public void setMenuIngredients(String menuIngredients) {
		MenuIngredients = menuIngredients;
	}
	public String getMenuAllergy() {
		return MenuAllergy;
	}
	public void setMenuAllergy(String menuAllergy) {
		MenuAllergy = menuAllergy;
	}
	public MenuVO() {
		super();
		// TODO Auto-generated constructor stub
	}
}
