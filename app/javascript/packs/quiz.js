document.addEventListener('turbolinks:load', () => {
// $('.quiz-start').addEventListener('turbolinks:load', () => {
  $(window).on('load', function(){
    var $q_cnt = 0;
    var $correct_cnt = 0;
    var total_cnt = gon.quiz_data.length;
    var questionSentence = ( gon.quiz_type == "capital") ? "の県庁所在地は？" : "がある都道府県は？";
  
  
    var displayTitle = function(cnt, total){
      $('#question-title').text("第" + (cnt) + "問   /   全：" + total + "問");
    }
  
    var displayQuestionAndAnswers = function(cnt){
      // 選択したボタンの色の強調を解除
      $('.answer').children('.btn').removeClass('btn-selected');

      // 問題文の表示
      $('#question').text("問題： " + gon.quiz_data[cnt][0] + questionSentence)
      // 回答選択肢の並べ替えと表示
      var $slide = Math.floor(Math.random() * 4);
      for (var i=0; i<4; i++){
        var j = (i + $slide ) % 4 ; 
        $('.answer').eq(j).children('.btn').text(gon.quiz_data[cnt][i+1]);
        if (i==0){
          $('.answer').eq(j).children('.btn').addClass('correct_answer');
        }
        $('.answers').find('.btn').prop('disabled', false)
      }
      // 判定文言のクリア
      $('.quiz-judge-sentence').text("");
    }
    
    // ボタン表示と値の初期化
    var initializeValueAndButton = function(){
      $q_cnt = 0;
      $correct_cnt = 0;

      $('.quiz-next').removeClass('display-none');
      $('.quiz-next').prop('disabled', true);
      $('.quiz-end').addClass('display-none');

      $('.quiz-judge-sentence').text("");
    }

    // $(window).on('load',function(){
      $('#quizModal').modal('show');
      // $('#quizModal').fadeIn();
      // alert("window.on.load発火！");

      initializeValueAndButton();
      
      displayTitle(1, total_cnt);
      displayQuestionAndAnswers(0)
  
      $q_cnt++
    // })
  
    $('.quiz-start').click( function(){
      // $('#quizModal').modal('show');

      initializeValueAndButton();
      
      displayTitle(1, total_cnt);
      displayQuestionAndAnswers(0)
  
      $q_cnt++
    })

    $('.quiz-next').click( function(){
  
      displayTitle($q_cnt + 1, total_cnt);
      displayQuestionAndAnswers($q_cnt);
  
      $('.quiz-next').prop('disabled', true);
  
      $q_cnt++;
    });
  
    $('.answer').children('.btn').click( function(){
      if ($(this).hasClass('correct_answer')){
        $('.quiz-judge-sentence').text("正解です！");
        $correct_cnt++;
      }else{
        $('.quiz-judge-sentence').text("違います！");
      }
      $('.answers').find('.btn').prop('disabled', true).removeClass('correct_answer');
      // $('.answers').find('.btn').addClass('btn-secondary');

      // 選択したボタンの色を強調
      $(this).addClass('btn-selected');
  
      if ($q_cnt == total_cnt){
        $('.quiz-end').prop('disabled', false);
        $('.quiz-end').removeClass('display-none');
        $('.quiz-next').addClass('display-none');
      }else{
        $('.quiz-next').prop('disabled', false);
      }
    });
  
    $('.quiz-end').click( function() {
      $('.quiz-result-sentence').html( total_cnt + "問中、" + $correct_cnt + "問、正解しました！");
      if ($correct_cnt == total_cnt){
        $('.quiz-result-sentence-add').html("全問正解！すごいぜ！自慢しよう！");
      }else{
        $('.quiz-result-sentence-add').html("");
      }
  
      $('.quiz-start').text("もう一度やる（復習）")
      $('#quizModal').hide();
  
    })
  
  });
  
})