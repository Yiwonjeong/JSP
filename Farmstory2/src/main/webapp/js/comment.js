 /**
 *  댓글 CRUD 함수 정의
 */

// 댓글 작성 
function commentWrite(){
	
	$(function(){
		
		$('.commentForm > form').submit(function(e) {
			let no = $(this).children('input[name=no]').val();
			let uid = $(this).children('input[name=uid]').val();
			let textarea = $(this).children('textarea[name=content]');
			let content = textarea.val();
			
			if(content == ''){
				alert('댓글을 작성하세요.');
				return false;
			}
			
			let jsonData = { 
					"no": no,
					"uid": uid,
					"content": content
			};
			
			$.ajax({
				url:'/Farmstory2/board/commentWrite.do',
				method:'POST',
				data: jsonData,
				dataType:'json',
				success: function (data) {
					if(data.result > 0){
						
						let article = "<article>";
						article += "<span class='nick'>" + data.nick + "</span> ";
						article += "<span class='date'>" + data.date + "</span>";
						article += "<p class='content'>" + data.content + "</p>";
						article += "<div>";
						article += "<a href='#' class='remove' data-no='" + data.no + "'>삭제</a> ";
						article += "<a href='#' class='modify' data-no='" + data.no + "'>수정</a> ";
						article += "</div>";
						article += "</article>";
						
						$('.commentList > .empty').hide();
						$('.commentList').append(article);
						textarea.val('');
						
					}
				}
			});
				
			return false;
			
		});
		
		
	});

	
}

// 댓글 수정
function commentModify(){
	
	$(function(){
		
		$(document).on('click', '.modify', function(e) {
			e.preventDefault();
			let txt = $(this).text();
			p_tag = $(this).parent().prev();
			
			if(txt == '수정'){
				$(this).text('수정완료');
				p_tag.attr('contentEditable', true);
				p_tag.focus();
			}else{
				$(this).text('수정');
				
				let no = $(this).attr('data-no');
				let content = p_tag.text();
				
				let jsonData = {"no":no, "content":content};
				
				$.ajax({
					url:'/Farmstory2/board/commentModify.do',
					type:'POST',
					data:jsonData,
					dataType:'json',
					success:function(data){
						
						if(data.result == 1){
							alert('댓글이 수정되었습니다.');
							
							p_tag.attr('contentEditable', false);
						}
						
					}
				});
			}
		});
			
	
		
	});

	
}

// 댓글 삭제
function commentDelete(){
	
	$(function(){
		
		$(document).on('click', '.remove', function(e) {
			e.preventDefault();
			
			let isDeleteOk = confirm('정말 삭제하시겠습니까?');
			
			if(isDeleteOk){
				
				let article = $(this).closest('article');
				let no = $(this).attr('data-no');
				let parent = $(this).attr('data-parent');
				
				let jsonData = {"no":no, "parent":parent};
							
				$.ajax({
					url:'/Farmstory2/board/commentDelete.do',
					type: 'GET',
					data: jsonData,
					dataType: 'json',
					success: function (data) {
						if(data.result == 1){
							alert('댓글이 삭제되었습니다.');
							article.hide();
						}	
					}
				});
			}
		});
		
	});
}

function commentEmpty() {
	let articles = $('.commentList > article');
	if(articles.length == 0){ // 댓글이 없다면
		$('.empty').show();   // .empty 클래스 show 
	} else {				  // 댓글이 있다면
		$('.empty').hide();   // .empty 클래스 hide
	}
}