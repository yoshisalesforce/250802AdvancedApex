// New Millennium Delivery商品の一括作成スクリプト

List<Product2> productsToCreate = new List<Product2>();

// 商品データの定義（名前, ファミリー, 価格）
Map<String, Map<String, Object>> productData = new Map<String, Map<String, Object>>{
    'Pizza' => new Map<String, Object>{'Family' => 'Entree', 'Price' => 20.00},
    'Garlic Bread' => new Map<String, Object>{'Family' => 'Side', 'Price' => 6.00},
    'Chocolate Cake' => new Map<String, Object>{'Family' => 'Dessert', 'Price' => 5.00},
    'Coconut Water' => new Map<String, Object>{'Family' => 'Beverage', 'Price' => 3.00},
    'Hamburger' => new Map<String, Object>{'Family' => 'Entree', 'Price' => 20.00},
    'French Fries' => new Map<String, Object>{'Family' => 'Side', 'Price' => 6.00},
    'Carrot Cake' => new Map<String, Object>{'Family' => 'Dessert', 'Price' => 5.00},
    'Lemonade' => new Map<String, Object>{'Family' => 'Beverage', 'Price' => 3.00},
    'Hot Dog' => new Map<String, Object>{'Family' => 'Entree', 'Price' => 10.00},
    'Onion Rings' => new Map<String, Object>{'Family' => 'Side', 'Price' => 6.00},
    'Jello' => new Map<String, Object>{'Family' => 'Dessert', 'Price' => 2.50},
    'Iced Tea' => new Map<String, Object>{'Family' => 'Beverage', 'Price' => 3.00}
};

// Product2レコードを作成
for (String productName : productData.keySet()) {
    Map<String, Object> data = productData.get(productName);

    Product2 product = new Product2();
    product.Name = productName;
    product.Family = (String)data.get('Family');
    product.IsActive = true;
    product.Description = 'New Millennium Delivery ' + productName;
    product.QuantityUnitOfMeasure = 'Each';

    productsToCreate.add(product);
}

try {
    insert productsToCreate;
    System.debug('✓ ' + productsToCreate.size() + '個の商品を正常に作成しました');

    for (Product2 product : productsToCreate) {
        System.debug('作成: ' + product.Name + ' (ID: ' + product.Id + ')');
    }
} catch (Exception e) {
    System.debug('✗ エラーが発生しました: ' + e.getMessage());
}