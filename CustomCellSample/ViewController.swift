import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /// 画像のファイル名
    let imageNames = ["cat1.jpg", "cat2.jpg", "dog1.jpg", "dog2.jpg"]
    
    /// 画像のタイトル
    let imageTitles = ["ネコ1", "ネコ2", "イヌ1", "イヌ2"]
    
    /// 画像の説明
    let imageDescriptions = [
        "ボックスから顔だけだして下を見ているオス猫",
        "寝ころびながらじゃれる猫",
        "散歩中のポメラニアン",
        "お散歩中のワンちゃん"
    ]
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //サウンドデータの読み込み
        let soundPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("magic", ofType: "mp3")!)
        
        // AudioPlayerのインスタンスを生成
        audioPlayer = try! AVAudioPlayer(contentsOfURL: soundPath)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /// セルの個数を指定するデリゲートメソッド（必須）
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    /// セルに値を設定するデータソースメソッド（必須）
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セルを取得
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell") as! CustomTableViewCell
        
        // セルに値を設定
        cell.setCell(imageNames[indexPath.row], titleText: imageTitles[indexPath.row], descriptionText: imageDescriptions[indexPath.row])
        
        return cell
    }
    
    @IBAction func tapButton(sender: AnyObject) {
        print("test")
        // 音源を再生
        audioPlayer.play()
    }
    
}

