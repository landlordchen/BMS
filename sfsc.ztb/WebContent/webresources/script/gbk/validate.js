Array.prototype.max = function()
{
	var i, max = this[0];
	
	for( i = 1; i < this.length; i++ )
	{
		if( max < this[i] )
		max = this[i];
	}
	
	return max;
}

// Ϊ String ������һ�� trim ����
String.prototype.trim = function()
{
    // ��������ʽ��ǰ��ո��ÿ��ַ��������
    return this.replace( /(^\s*)|(\s*$)/g, "" );
}

// ��֤�Ƿ� ��ĸ����
function isAlphaNumeric( strValue,boxObj)
{
	// ֻ���� A-Z a-z 0-9 ֮�����ĸ���� ����Ϊ��
	return checkExp( /^\w*$/gi, strValue );
}

// ��֤�Ƿ� ����
function isDate( strValue,boxObj )
{
	// ���ڸ�ʽ������ 2001-10-1/2001-1-10 ����Ϊ��
	if( isEmpty( strValue ) ) return true;

	if( !checkExp( /^\d{4}-[01]?\d-[0-3]?\d$/, strValue ) ) 
	{
		return false;
	}
	// ���� /^\d{4}-[1-12]-[1-31]\d$/
	
	var arr = strValue.split( "-" );
	var year = arr[0];
	var month = arr[1];
	var day = arr[2];
	
	if(year<1900||year>2060)
	{
		return false;
	}

	// 1 <= �·� <= 12��1 <= ���� <= 31
	if( !( ( 1<= month ) && ( 12 >= month ) && ( 31 >= day ) && ( 1 <= day ) ) )
	{
		return false;
	}
		
	// ������
	if( !( ( year % 4 ) == 0 ) && ( month == 2) && ( day == 29 ) )
	{
		return false;
	}
	
	// 7����ǰ��˫��ÿ�²�����30��
	if( ( month <= 7 ) && ( ( month % 2 ) == 0 ) && ( day >= 31 ) )
	{
		return false;
	}
	
	// 8���Ժ�ĵ���ÿ�²�����30��
	if( ( month >= 8) && ( ( month % 2 ) == 1) && ( day >= 31 ) )
	{
		return false;
	}
	
	// 2�����29��
	if( ( month == 2) && ( day >=30 ) )
	{
		return false;
	}
	
	return true;
}

// ��֤�Ƿ� ����
function isShortDate( strValue,boxObj )
{
	var DATETIME = strValue;
	if( isEmpty( strValue ) ) return true;
	if( !checkExp(/^\d{4}-[01]?\d/g,DATETIME) )
	{
		return false;
	}

	var arr = DATETIME.split( "-" );
	var year = arr[0];
	var month = arr[1];
	if(year<1753)
	{
		return false;
	}

	if(arr.length==3)
	{
	   return false;
	}
	if( !((1<= month ) && ( 12 >= month )))
	{
		return false;				
	}
	
	return true;
}

// ��֤�Ƿ� Email
function isEmail( strValue,boxObj )
{
	// Email ������ x@a.b.c.d �ȸ�ʽ ����Ϊ��
	if( isEmpty( strValue ) ) return true;
	
	//return checkExp( /^\w+@(\w+\.)+\w+$/gi, strValue );	//2001.12.24���Գ��� ��� jxj-xxx@114online.comʱ����ͨ��
	//Modify By Tianjincat 2001.12.24
	var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	return checkExp( pattern, strValue );
	
}

// ��֤�Ƿ� ����
function isNumeric( strValue,boxObj )
{
	// ���ֱ����� 0123456789 ����Ϊ��
	if( isEmpty( strValue ) ) return true;
	if( !checkExp( /^[+-]?\d+(\.\d+)?$/g, strValue ))
	{
		return false;
	}
	return true;
}

// ��֤�Ƿ� ����
function isMoney( strValue,boxObj )
{
	// ���ұ����� -12,345,678.9 �ȸ�ʽ ����Ϊ��
	if( isEmpty( strValue ) ) return true;
	
	return checkExp( /^[+-]?\d+(,\d{3})*(\.\d+)?$/g, strValue );
}

// ��֤�Ƿ� �绰
function isPhone( strValue,boxObj )
{
	// ��ͨ�绰	(0755)4477377-3301/(86755)6645798-665
	// Call ��	95952-351
	// �ֻ�		130/131/135/136/137/138/13912345678
	// ����Ϊ��
	if( isEmpty( strValue ) ) return true;
	
	return checkExp( /(^\(\d{3,5}\)\d{6,8}(-\d{2,8})?$)|(^\d+-\d+$)|(^(130|131|135|136|137|138|139)\d{8}$)/g, strValue );
}

// ��֤�Ƿ� ��������
function isPostalCode( strValue,boxObj )
{
	if( isEmpty( strValue ) ) return true;
	// �������������6λ����
	if(!checkExp( /(^$)|(^\d{6}$)/gi, strValue ))
	{
		return false;
	}
	return true;
}

// ��֤�Ƿ� URL
function isURL( strValue,boxObj )
{
	// http://www.yysoft.com/ssj/default.asp?Type=1&ArticleID=789
	if( isEmpty( strValue ) ) return true;
	
	var pattern = /^(http|https|ftp):\/\/(\w+\.)+[a-z]{2,3}(\/\w+)*(\/\w+\.\w+)*(\?\w+=\w*(&\w+=\w*)*)*/gi;
	// var pattern = /^(http|https|ftp):(\/\/|\\\\)(\w+\.)+(net|com|cn|org|cc|tv|[0-9]{1,3})((\/|\\)[~]?(\w+(\.|\,)?\w\/)*([?]\w+[=])*\w+(\&\w+[=]\w+)*)*$/gi;
	// var pattern = ((http|https|ftp):(\/\/|\\\\)((\w)+[.]){1,}(net|com|cn|org|cc|tv|[0-9]{1,3})(((\/[\~]*|\\[\~]*)(\w)+)|[.](\w)+)*(((([?](\w)+){1}[=]*))*((\w)+){1}([\&](\w)+[\=](\w)+)*)*)/gi;

	return checkExp( pattern, strValue );
	
}
function trim(strValue)
{
	if(!strValue||strValue=='') return strValue;
	while(strValue.substring(0,1)==' ')
	{
		strValue=strValue.substring(1);
	}
	if(strValue=='') return strValue;
	while(strValue.substring(strValue.length-1,strValue.length)==' ')
	{
		strValue=strValue.substring(0,strValue.length-1);
	}
	return strValue;
}

function isNotEmpty( strValue,boxObj )
{
	strValue=trim(strValue);
	if( !strValue||strValue == '' )
		return false;
	else
		return true;
}

function isEmpty( strValue,boxObj )
{
	strValue=trim(strValue);
	if( strValue == "" )
		return true;
	else
		return false;
}
