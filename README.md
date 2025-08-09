# Salesforce プロジェクト事前準備書

## 1. 事前準備

### 1.1 準備作業
#### 必要なツール・環境準備
- [x] メモ取り用ツール（紙とペン または 電子メモ）
- [x] 新規Trailhead Playground環境の作成
- [x] パッケージインストール用権限の確認

#### 注意事項
- 既存のOrg使用は推奨されない（チャレンジ検証に問題が生じる可能性）
- 新規環境での作業を強く推奨

### 1.2 パッケージインストール作業
#### インストール対象
- **パッケージタイプ**: 非管理パッケージ（Unmanaged Package）
- **パッケージID**: `04tf4000001O5si`
- **内容**: スキーマとコード（チャレンジ完了に必要）

#### 作業手順
1. Trailhead Playgroundにログイン
2. セットアップ > アプリ > パッケージマネージャー
3. パッケージIDを使用してインストール実行
4. インストール完了確認

#### トラブルシューティング
- インストールに問題が発生した場合は、Trailhead Playground Management モジュールの手順を参照

### 1.3 ERD確認作業
- [x] Product オブジェクトERDの確認
- [x] Schedule オブジェクトERDの確認
- [x] オブジェクト間のリレーションシップの理解

### 1.4 Product Family設定変更作業
#### 変更対象
Product2 オブジェクトの Product Family 選択リスト値

#### 変更内容
**変更前**: 既存の値
**変更後**: 以下の4つの値のみ
- Entree（メインディッシュ）
- Side（サイドディッシュ）
- Dessert（デザート）
- Beverage（飲み物）

#### 作業手順
1. セットアップ > オブジェクトマネージャー > Product2
2. 項目とリレーション > Product Family
3. 値の編集で指定された4つの値のみを残す
4. 不要な値を削除または非アクティブ化

### 1.5 Product ページレイアウト変更作業
#### 変更内容
以下の項目をページレイアウトに追加:
- Initial Inventory（初期在庫）
- Quantity Ordered（注文数量）
- Quantity Remaining（残存数量）

#### 作業手順
1. セットアップ > オブジェクトマネージャー > Product2
2. ページレイアウト > Product Layout
3. 指定された項目をレイアウトに追加

### 1.6 Account ページレイアウト変更作業
#### 変更内容
Orders関連リストの表示追加

#### 作業手順
1. セットアップ > オブジェクトマネージャー > Account
2. ページレイアウト > Account Layout
3. 関連リスト section > Orders関連リストを追加

### 1.7 Order ページレイアウト変更作業
#### 変更内容
Contract Number項目の削除（存在する場合）

#### 作業手順
1. セットアップ > オブジェクトマネージャー > Order
2. ページレイアウト > Order Layout
3. Contract Number項目を確認し、存在する場合は削除

### 1.8 開発制約事項の確認
#### メソッド使用に関する制約
- 非管理パッケージで提供されたメソッドを使用
- メソッド名および署名（シグネチャ）の変更禁止
- 要件で明示的に変更指示がある場合のみ例外

#### 開発ガイドライン
- パッケージ提供のコードを基盤として使用
- カスタム開発は最小限に留める
- 既存機能との整合性を維持

## 2. 事前準備チェックリスト

### 2.1 環境準備
- [x] 新規Trailhead Playground作成完了
- [x] パッケージ（04tf4000001O5si）インストール完了
- [x] ERD確認完了

### 2.2 設定変更
- [x] Product Family値の更新完了
- [x] Product ページレイアウト更新完了
- [x] Account ページレイアウト更新完了
- [x] Order ページレイアウト更新完了

### 2.3 最終確認
- [ ] 全ての設定変更が正常に反映されているか確認
- [ ] テストデータでの動作確認実施
- [ ] 開発制約事項の理解完了

## 3. New Millennium Delivery商品データ作成

### 3.1 商品データ検証・作成作業

#### 作成されたファイル
- `scripts/apex/product-verification.apex`: 商品データの存在確認スクリプト
- `scripts/apex/create-millennium-products.apex`: New Millennium Delivery商品の一括作成スクリプト
- `pizza-product.json`: 商品作成用サンプルJSONファイル

#### 商品データ作成結果
**作成された12個の商品**:
1. **Pizza** (Entree) - $20.00
2. **Garlic Bread** (Side) - $6.00
3. **Chocolate Cake** (Dessert) - $5.00
4. **Coconut Water** (Beverage) - $3.00
5. **Hamburger** (Entree) - $20.00
6. **French Fries** (Side) - $6.00
7. **Carrot Cake** (Dessert) - $5.00
8. **Lemonade** (Beverage) - $3.00
9. **Hot Dog** (Entree) - $10.00
10. **Onion Rings** (Side) - $6.00
11. **Jello** (Dessert) - $2.50
12. **Iced Tea** (Beverage) - $3.00

#### 実行方法
```bash
# 商品データの存在確認
sf apex run --file scripts/apex/product-verification.apex --target-org [ORG_ALIAS]

# New Millennium Delivery商品の一括作成
sf apex run --file scripts/apex/create-millennium-products.apex --target-org [ORG_ALIAS]
```

### 3.2 SSH設定作業

#### GitHubアクセス用SSH設定完了
- SSH鍵生成: `id_ed25519_github`
- GitHubアカウントへの公開鍵登録完了
- SSH接続テスト成功

#### SSH設定手順
```bash
# SSH鍵生成
ssh-keygen -t ed25519 -C "yr.980827@gmail.com" -f ~/.ssh/id_ed25519_github -N ""

# SSHエージェントに追加
ssh-add ~/.ssh/id_ed25519_github

# 接続テスト
ssh -T git@github.com
```

## 4. 次のステップ

事前準備完了後、プロジェクト概要の確認とその後の文書作成に進む

---

**作成日**: 2025年8月3日
**更新日**: 2025年8月8日
**作成者**: プロジェクトチーム
**承認者**: [承認者名]
