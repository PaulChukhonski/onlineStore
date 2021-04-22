package beans;

import java.util.ArrayList;

public class CartItem {
    private String itemId;
    private int amount;

    public CartItem() {
    }

    public CartItem(String itemId, int amount) {
        this.itemId = itemId;
        this.amount = amount;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "itemId=" + itemId +
                ", amount='" + amount + '\'' +
                '}';
    }

    public boolean check(ArrayList<CartItem> cartList, String id) {
        boolean flag = false;
        for(CartItem item : cartList) {
            String tid = item.getItemId();
            if(tid.equals(id)) {
                flag = true;
                break;
            }
        }
        return flag;
    }

    public ArrayList<CartItem> remove(ArrayList<CartItem> cartList, String id) {
        for(CartItem item : cartList) {
            if(item.getItemId().equals(id)) {
                if(item.getAmount() == 1) {
                    cartList.remove(item);
                } else {
                    int amount = item.getAmount();
                    item.setAmount(amount-1);
                }
                break;
            }
        }
        return cartList;
    }

    public void add(ArrayList<CartItem> cartList, String id) {
        for(CartItem item : cartList) {
            if(item.getItemId().equals(id)) {
                int amount = item.getAmount();
                item.setAmount(amount+1);
            }
        }
    }
}
