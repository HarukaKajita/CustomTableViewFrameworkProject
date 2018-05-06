# CustomTableViewFrameworkProject
エンプティビューを実装したCustomTableViewを作成しました。

# 内容
UITableViewクラスを継承したCustomTableViewクラスを使うとセクション数が0の時にテーブルビュー全体に重なる様にエンプティビューが表示されます。

CutomTableViewのコンストラクタは  
1. init(frame: CGRect, style: UITableViewStyle)
2. init(coder: NSCoder)
3. init(frame: CGRect, style: UITableViewStyle, emptyView: UIView) 

の3つが存在し、1,2で初期化されたCustomTableViewはデフォルトで設定されたエンプティビューが表示されます。  
独自のエンプティビューを表示したい場合は3のコンストラクタで初期化して下さい。

CustomTableViewを使う際は

    class ViewController: UIViewController,CustomTableViewProtocol{

        @IBOutlet weak var myTableView: CustomTableView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
        
            myTableView.customTableViewDelegate = self
        }
    }

    extension ViewController{
        func customTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return rowNum
        }

        func customNumberOfSections(in tableView: UITableView) -> Int {
            return sectionNum
        }

        func customTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "myCell")
            return cell
        }

        func customTableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return rowHeight
        }

        func customTableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return sectionTitle
        }

        func customTableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return headerHeight
        }
    }
の様にCustomTableView用のデリゲートメソッドを定義して下さい。
通常のUITableViewを使用する時に定義するデリゲートメソッドの名前の頭に「custom」が付いているメソッドがCutomTableView用のデリゲートメソッドです。  
  
  
# 備考
一応できる限り仕上げました。僕の知らない範囲で良くない作りをしてたりする可能性もあります。
これ以上は時間とモチベーション的に修正、改善は出来ません。🙇  
frameworkフォルダにフレームワークファイル入れてあります。
