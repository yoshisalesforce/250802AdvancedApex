// New Millennium Delivery商品データの存在確認スクリプト

// New Millennium Deliveryの商品リスト
Set<String> expectedProducts = new Set<String>{
    'Pizza', 'Garlic Bread', 'Chocolate Cake', 'Coconut Water',
    'Hamburger', 'French Fries', 'Carrot Cake', 'Lemonade',
    'Hot Dog', 'Onion Rings', 'Jello', 'Iced Tea'
};

// 既存の全商品を取得
List<Product2> existingProducts = [SELECT Name FROM Product2];
Set<String> existingProductNames = new Set<String>();

for (Product2 product : existingProducts) {
    existingProductNames.add(product.Name);
}

// 比較結果を表示
System.debug('=== New Millennium Delivery商品の存在確認 ===');
System.debug('期待される商品数: ' + expectedProducts.size());
System.debug('既存の商品数: ' + existingProducts.size());

// 存在する商品をチェック
Set<String> foundProducts = new Set<String>();
Set<String> missingProducts = new Set<String>();

for (String expectedProduct : expectedProducts) {
    if (existingProductNames.contains(expectedProduct)) {
        foundProducts.add(expectedProduct);
        System.debug('✓ 存在: ' + expectedProduct);
    } else {
        missingProducts.add(expectedProduct);
        System.debug('✗ 不足: ' + expectedProduct);
    }
}

System.debug('');
System.debug('=== 結果サマリー ===');
System.debug('存在する商品: ' + foundProducts.size() + '個');
System.debug('不足している商品: ' + missingProducts.size() + '個');

if (missingProducts.size() > 0) {
    System.debug('不足している商品リスト: ' + missingProducts);
} else {
    System.debug('すべての商品が存在します！');
}