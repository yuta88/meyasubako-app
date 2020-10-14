// 入力フォームの残りの入力可能文字数を表示
$(function() {

  // 入力フォームの文字数をカウント(\nは"改行"に変換し2文字カウント)
  var count = $(".js-text").text().replace(/\n/g, "改行").length;

  // 残りの入力可能文字数を計算
  var now_count = 100 - count;

  // 文字数オーバーの場合は文字色を赤色に
  if (count > 100) {
    $(".js-text-count").css("color", "red");
  }

  // 残りの入力可能文字数を表示
  $(".js-text-count").text( "残り" + now_count + "文字");

  // キーボード入力後の入力フォームの残りの入力可能文字数を表示
  $(".js-text").on("keyup", function() {

    var count = $(this).val().replace(/\n/g, "改行").length;

    var now_count = 100 - count;

    if (count > 100) {
      $(".js-text-count").css("color", "red");
    } else {
      $(".js-text-count").css("color", "black");
    }

    $(".js-text-count").text( "残り" + now_count + "文字");
  });
});