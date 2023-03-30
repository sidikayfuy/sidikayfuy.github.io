$( document ).ready(function() {
    setTimeout(() => {
        let voices = window.speechSynthesis.getVoices();
    });
    let vb = $('#vb')
    let sb = $('#sb')
    let vibro = $('#vibro')
    let speech = $('#speech')

    vb.on('click touchstart', function (){
        if (vibro.is(':hidden')){
            if (speech.is(':visible')){
                speech.hide()
            }
            vibro.show()
        }
        else {
            vibro.hide()
        }
    })

    sb.on('click touchstart', function (){
        if (speech.is(':hidden')){
            if (vibro.is(':visible')){
                vibro.hide()
            }
            speech.show()
        }
        else {
            speech.hide()
        }
    })
    let recog;
    $("#startrecog").on('click touchstart', function (){
        $('#stoprecog').attr('disabled', false)
        $('#startrecog').attr('disabled', true)
        recog = new webkitSpeechRecognition;
        recog.lang = 'ru-RU';
        recog.interimResults = false;
        recog.start();

        recog.onresult = function (event){
            let res = event.results[0][0].transcript
            $('#recogres').val(res);
        }

        recog.onend = function (){
            recog.start()
        }
    })

    $('#stoprecog').on('click touchstart', function (){
        $('#stoprecog').attr('disabled', true)
        $('#startrecog').attr('disabled', false)
        $('#recogres').val('');
        recog.stop()
        recog = null
    })

    $('#startsyntes').on('click touchstart', function (){
        let utterance = new SpeechSynthesisUtterance($('#syntes').val());
        utterance.lang = 'ru-RU'

        setTimeout(() => {
            let voices = window.speechSynthesis.getVoices();
            utterance.voice = voices[4]
            speechSynthesis.speak(utterance);
        }, 100);

    })

    $('#stopsyntes').on('click touchstart', function (){
        speechSynthesis.cancel()
    })

    $('#vibr').on('click touchstart', function (){
        navigator.vibrate([200,100,200,100,200,50,50,50,50,50,50,50,50,50,50]);
    })

});
