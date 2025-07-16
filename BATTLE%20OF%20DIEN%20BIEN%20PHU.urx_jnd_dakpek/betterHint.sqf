oft_fnc_better_hint = {
	params ["_eventName"];

	if (_eventName == "p1e1") then {
		hint parseText "HAM DAN PHAO CUA PHAP TAI HIM LAM TRUNG PHAO PHAT NO.<br/><br/><img size = '10' image='hintPics\Picture1.jpg'/>";
	};
	if (_eventName == "p1e2") then {
		hint parseText "<br/>PAUL PEGOT, CHI HUY TIEU DOAN 3 TAI DOI HIM LAM, TRUNG PHAO CHET TRONG HAM CHI HUY CUNG RADIO, DOI HIM LAM MAT LIEN LAC VOI PHAN KHU TRUNG TAM<br/><img size = '7' image='hintPics\Picture2.jpg'/>";
	};
	if (_eventName == "p1e3") then {
		hint parseText "<br/>SU DOAN 312 DA CHIEM DUOC DOI HIM LAM!<br/><img size = '7' image='hintPics\Picture3.jpg'/>";
	};
	if (_eventName == "p2e1") then {
		hint parseText "<br/>TRUNG DOAN 165 VA TRUNG DOAN 88 DA CHIEM DUOC DOI DOC LAP!<br/><img size = '7' image='hintPics\Picture3.jpg'/>";
	};
	if (_eventName == "p2e2") then {
		hint parseText "<br/>TRUNG TA CHARLES PIROTH, CHI HUY PHAO BINH CUA PHAP, TU SAT BANG LUU DAN TRONG HAM CHI HUY.<br/><img size = '7' image='hintPics\Picture4.jpg'/>";
	};
	if (_eventName == "p2e3") then {
		hint parseText "<br/>LINH PHAP BO CHAY KHOI DOI BAN KEO, TRUNG DOAN 36 CHIEM DUOC DOI BAN KEO MA KHONG TON VIEN DAN NAO.<br/><img size = '7' image='hintPics\Picture5.jpg'/>";
	};
	if (_eventName == "p2e4") then {
		hint parseText "<br/>MY TU CHOI THAM CHIEN TAI DIEN BIEN PHU.<br/><img size = '7' image='hintPics\Picture6.jpg'/>";
	};
	if (_eventName == "p3e1") then {
		hint parseText "<br/>SU DOAN 312 DA CHIEM DUOC DOI A1.<br/><img size = '7' image='hintPics\Picture3.jpg'/>";
	};
	if (_eventName == "p3e2") then {
		hint parseText "<br/>QUAN PHAP CHINH THUC TUYEN BO DAU HANG VAO LUC 17h30 NGAY 7/5/1954.<br/><img size = '7' image='hintPics\Picture7.jpg'/>";
	};
	if (_eventName == "p3e3") then {
		hint parseText "<br/>QUAN VIET MINH DA DANH CHIEN THANG TAI DIEN BIEN PHU.<br/><img size = '7' image='hintPics\Picture8.jpg'/>";
	};
};

publicVariable "oft_fnc_better_hint";