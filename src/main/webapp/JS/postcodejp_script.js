function initPostcodeJp() {

    // APIキーを指定して住所補完サービスを作成
    var postcodeJp = new postcodejp.address.AutoComplementService('ZsJmUiaZfpOP65MdUEoJ7NjjZnggXFHKa1LfsCL');//引数はAPIKey

    // 郵便番号テキストボックスを指定
    postcodeJp.setZipTextbox('input_zip')

    // 住所補完フィールドを追加
    postcodeJp.add(new postcodejp.address.StateTextbox('input_state_town'));
    postcodeJp.add(new postcodejp.address.TownStreetTextbox('input_street'));
    

    // 郵便番号テキストボックスの監視を開始
    postcodeJp.observe();

    }
    if(window.addEventListener){
        window.addEventListener('load', initPostcodeJp)
    }else{
        window.attachEvent('onload', initPostcodeJp)
    }
