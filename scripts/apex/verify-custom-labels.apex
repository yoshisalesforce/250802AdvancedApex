// カスタムラベルの存在確認スクリプト

System.debug('=== カスタムラベルの確認 ===');

try {
    // Select_Oneラベルの確認
    String selectOneValue = System.Label.Select_One;
    System.debug('✓ Select_One ラベル: "' + selectOneValue + '"');

    // Inventory_Level_Lowラベルの確認
    String inventoryLowValue = System.Label.Inventory_Level_Low;
    System.debug('✓ Inventory_Level_Low ラベル: "' + inventoryLowValue + '"');

    System.debug('');
    System.debug('=== 結果 ===');
    System.debug('両方のカスタムラベルが正常に作成されました！');

} catch (Exception e) {
    System.debug('✗ エラーが発生しました: ' + e.getMessage());
}