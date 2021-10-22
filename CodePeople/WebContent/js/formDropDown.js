

let jobGroupOptionNo;

const setOptions = () => {
	
	  options = document.querySelectorAll('.option');  
	  options.forEach(option => {
	    option.addEventListener("click", event => {
	      let tag = event.currentTarget;
	      if($(tag).attr('idx') == 1){
	    	  $('#jtCodeNo').val($(tag).val());
	    	  $('#jt-display').val($(tag).text());
	    	  console.log('jtcodeno')
	      }else if($(tag).attr('idx') == 2){
	    	  $('#plCodeNo').val($(tag).val());
	    	  $('#pl-display').val($(tag).text());
	    	  console.log('plCodeNo')
	      }
	    });
	  });
	}

//드랍박스 직군의 옵션에서만 적용되는 메서드
const setJobGroupOptions = () =>{
	
	jobGroupOptions = document.querySelectorAll('.jobGroupOption');
	jobGroupOptions.forEach(option=>{
        option.addEventListener('click', event=>{
        	jobGroupOptionNo = event.currentTarget.value;
	console.log('jobGroupOptionNo : ' + jobGroupOptionNo);
		    let tag = event.currentTarget;
		      console.log($(tag).text());
		    if($(tag).attr('idx') == 0){
		    	$('#jgCodeNo').val($(tag).val());
		  	  $('#jg-display').val($(tag).text());
		    }
        })
    })
}

//드랍박스에서 직군의 옵션값을 가져오는 메서드
const initJobGroupList = (target) => {
	$.ajax({
		url : '/CodePeople/jobGroupList.do',
		type : 'get',
		dataType : 'json',
		success : function(res){
			let code = '<li><h5 class="dropdown-header">직군</h5></li>';
			let datas = res;
			datas.forEach(data=>{
				code +=  `<li class="dropdown-item jobGroupOption" idx="0" value="${data.jgCodeNo}">${data.jgCodeNm}</li>`;
			});
			let parent = target.parentElement.querySelector('.dropdown-menu');
			parent.innerHTML = code;	
			setJobGroupOptions();
		},
		error : function(xhr){
			alert(`status : ${xhr.status}\ntext : ${xhr.statusText}`);
		}
	})
}

// 드랍박스에서 활동분야의 옵션값을 가져오는 메서드
const initProgLangList = (target) => {
	$.ajax({
		url : '/CodePeople/progLangList.do',
		type : 'get',
		dataType : 'json',
		success : function(res){
			let code = '<li><h5 class="dropdown-header">활동분야</h5></li>';
			let datas = res;
			datas.forEach(data=>{
				code += `<li class="dropdown-item option" idx="2" value="${data.plCodeNo}">${data.plCodeNm}</li>`;
			})
			let parent = target.parentElement.querySelector('.dropdown-menu');
			parent.innerHTML = code;	
			setOptions();
		},
		error : function(xhr){
			alert(`status : ${xhr.status}\ntext : ${xhr.statusText}`);
		}		
	})
}
//드랍박스에서 직무의 옵션값을 가져오는 메서드
const initJobTitleList = (target) => {
	$.ajax({
		url : '/CodePeople/jobTitleList.do',
		type : 'get',
		data : { "jobGroupOptionNo" : jobGroupOptionNo},
		dataType : 'json',
		success : function(res){
			let code = '<li><h5 class="dropdown-header">직무</h5></li>';
			let datas= res;
			if(jobGroupOptionNo !== 0){
				datas.forEach(data=>{
					code += `<li class="dropdown-item option" idx="1" value="${data.jtCodeNo}">${data.jtCodeNm}</li>`;
				})
			}else{
				code += `<li>직무를 선택해주세요</li>`;
			}
			let parent = target.parentElement.querySelector('.dropdown-menu');
			parent.innerHTML = code;
			setOptions();
		},
		error : function(xhr){
			alert(`status : ${xhr.status}\ntext : ${xhr.statusText}`);
		}
		
	})
}
