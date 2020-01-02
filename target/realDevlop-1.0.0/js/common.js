
/**
 * @JavaScript Name : common.js
 * @Description : 공통 js
 * @Modification Information
 *
 *   수정일         수정자                   수정내용
 *  -------    --------    ---------------------------
 *  2009.02.01            최초 생성
 *
 * author 실행환경 개발팀
 * since 2009.02.01
 *
 * Copyright (C) 2009 by MOPAS  All right reserved.
 */


/**
 * Window Load
 * @params
 * @return 
 */
$(window).load(function(){
	$.ajaxSetup({
        error:function(x,e){
        	if(x.status === 0){
        		alert('You are offline!!n Please Check Your Network.');
            }else if(x.status === 404){
            	alert('Requested URL not found.');
            }else if(x.status === 500){
            	alert('Internel Server Error.');
            }else if(e === 'parsererror'){
            	alert('Error.nParsing JSON Request failed.');
            }else if(e === 'timeout'){
            	alert('Request Time out.');
            }else {
            	alert('Unknow Error.n'+x.responseText);
            }
        }
    });
});


/**
 * aJax Call 공통함수
 * @params
 * 	- _url : Call Url
 *  - _param : param
 *  - _func : Return Func
 * @return 
 */
const _ajaxCall = function(_url, _param, _func) {
	$.ajax({
		url : _url,
		type : "POST",
		data : _param,
		beforeSend : function(xmlHttpRequest){
			xmlHttpRequest.setRequestHeader("AJAX", "true");
		},
		success : _func,
		error : function(xhr,status,error){_ajaxError(xhr,status,error)}
	});
}


/**
 * aJax Call Err 공통함수
 * @params
 * 	- _xhr : 
 *  - _status : 
 *  - _error : 
 * @return 
 */
const _ajaxError = function(_xhr, _status, _error) {
	console.log( _xhr );
	console.log( _status );
	console.log( _error );

	if (_xhr.status  ===  401) {
	} 
}

/**
 * 종료일자로 부터 시작일자의 일수 차이를 채크
 * @params
 * 	- _stDate : 시작일자
 *  - _endDate : 종료일자
 *  - _diffDay : 차이일수
 * @return 해당일자보다 크면 false, 작으면 True
 */
function _diffDateCheck(_stDate, _endDate, _diffDay){

	var stDateChk = new Date(_stDate.substring(0,4), _stDate.substring(4,6)-1, _stDate.substring(6,8));
	var endDateChk = new Date(_endDate.substring(0,4), _endDate.substring(4,6)-1,_endDate.substring(6,8));

	var chkDate = (endDateChk - stDateChk)/1000/60/60/24;
	if(chkDate > _diffDay)
		return false;
	else
		return true;
}


/**
 * 좌측문자열채우기
 * @params
 *  - str : 원 문자열
 *  - padLen : 최대 채우고자 하는 길이
 *  - padStr : 채우고자하는 문자(char)
 * @return String
 */
const _lpad = function (str, padLen, padStr) {
    if (padStr.length > padLen) {
        return str;
    }
    str += ""; // 문자로
    padStr += ""; // 문자로
    while (str.length < padLen)
        str = padStr + str;
    str = str.length >= padLen ? str.substring(0, padLen) : str;
    return str;
}

/**
 * 우측문자열채우기
 * @params
 *  - str : 원 문자열
 *  - padLen : 최대 채우고자 하는 길이
 *  - padStr : 채우고자하는 문자(char)
 * @return String
 */
const _rpad = function (str, padLen, padStr) {
    if (padStr.length > padLen) {
        return str + "";
    }
    str += ""; // 문자로
    padStr += ""; // 문자로
    while (str.length < padLen)
        str += padStr;
    str = str.length >= padLen ? str.substring(0, padLen) : str;
    return str;
}


/**
 * 숫자 3자리 콤마
 * @params
 *  - str : 숫자데이터
 * @return String
 */
const _numberWithCommas = function (x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


let btnClickFlag = true;
const overClick = function () {

     if (btnClickFlag) {
        //console.log("클릭됨");
        btnClickFlag = !btnClickFlag;

        // 타이밍 추가
        setTimeout(function () {
            btnClickFlag = true;
        }, 1500)

     } else {
        //console.log("중복됨");
        return false;
     }
}
