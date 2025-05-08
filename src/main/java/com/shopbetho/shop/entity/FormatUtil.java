package com.shopbetho.shop.entity;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;

public class FormatUtil {
    public static String formatCurrency(double amount) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        symbols.setGroupingSeparator('.'); // Dấu phân cách phần nghìn: chấm
        DecimalFormat formatter = new DecimalFormat("#,###", symbols);
        return formatter.format(amount);
    }
}
