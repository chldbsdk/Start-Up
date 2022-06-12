package com.nakwon.domain;

public class MenuVO {
	private String Code;
	private String CodeName;
	private String MenuCode;
	private String MenuCodeName;
	private String MenuDetailCode;
	private String MenuDetailCodeName;
	private String MenuContent;
	private String MenuImg;
	private String MenuPrice;
	private String MenuIngredients;
	private String MenuAllergy;
	
	@Override
	public String toString() {
		return "MenuVO [Code=" + Code + ", MenuCode=" + MenuCode + ", MenuCodeName=" + MenuCodeName
				+ ", MenuDetailCode=" + MenuDetailCode + ", MenuDetailCodeName=" + MenuDetailCodeName + ", MenuContent="
				+ MenuContent + ", MenuImg=" + MenuImg + ", MenuPrice=" + MenuPrice + ", MenuIngredients="
				+ MenuIngredients + ", MenuAllergy=" + MenuAllergy + "]";
	}

	
	public String getCode() {
		return Code;
	}
	public void setCode(String code) {
		Code = code;
	}
	public String getCodeName() {
		return CodeName;
	}
	public void setCodeName(String codeName) {
		CodeName = codeName;
	}
	public String getMenuCode() {
		return MenuCode;
	}
	public void setMenuCode(String menuCode) {
		MenuCode = menuCode;
	}
	public String getMenuCodeName() {
		return MenuCodeName;
	}
	public void setMenuCodeName(String menuCodeName) {
		MenuCodeName = menuCodeName;
	}
	public String getMenuDetailCode() {
		return MenuDetailCode;
	}
	public void setMenuDetailCode(String menuDetailCode) {
		MenuDetailCode = menuDetailCode;
	}
	public String getMenuDetailCodeName() {
		return MenuDetailCodeName;
	}
	public void setMenuDetailCodeName(String menuDetailCodeName) {
		MenuDetailCodeName = menuDetailCodeName;
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
}
