# プレイヤー(自分)に「0~2」を入力させるロジックを書きます。
class Player
  def hand

    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"

    input_hand = gets.to_i
    # 「input_hand」が「0, 1, 2」のいずれかだと繰り返し処理を終了し、それ以外（アルファベットも含む）だと繰り返し処理を継続します。
    while true
       if input_hand == 0 || 1 ||2
      # ヒント：include?メソッドについて調べてみましょう。
         return input_hand
       else
         puts "0〜2の数字を入力してください。"
         puts "0:グー, 1:チョキ, 2:パー"
         
        input_hand = gets.to_i
       end
    end
  end
end
# 相手が「0~2」の値をランダムに生成するロジックを書きます。
class Enemy
  def hand
    enemy_hand = rand(2)
  end
end
# プレイヤー(自分)が入力した「0~2」と、敵がランダムで生成した「0~2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
    # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
    janken = ["グー", "チョキ", "パー"]
    #「相手の手は#{相手の手}です。」と出力させます。
    puts "相手の手は#{janken[enemy_hand]}です。"
    # Playerクラスの戻り値とEnemyクラスの戻り値からじゃんけんするロジックを作成します。
    if player_hand == enemy_hand
      puts "あいこ"
        return true
    elsif
       (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
            puts "あなたの勝ちです"
            return false
    else
            puts "あなたの負けです"
            return false
    end
  end
end
# じゃんけんゲームを実行するロジックを書きます。
class GameStart
  # selfを使用することで、GameStartをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。
  def self.jankenpon
    # 変数「player」にPlayerをインスタンス化したものを代入します。
    player = Player.new
    # 変数「enemy」にEnemyをインスタンス化したものを代入します。
    enemy = Enemy.new
    # 変数「janken」にJankenをインスタンス化したものを代入します。
    janken = Janken.new
    next_game = true
    # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続します。
    while next_game
      # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
      #「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end
# クラス名を使ってjankenponメソッドを呼び出します。
GameStart.jankenpon
