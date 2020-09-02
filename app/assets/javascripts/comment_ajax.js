//--------------------------  Comment非同期編集 機能実装
$(function () {
  $(document).on("click", '.js-edit-comment-button', function () {
    const commentId = $(this).data('comment-id');
    const commentLabelArea = $('#js-comment-label-' + commentId);
    const commentTextArea = $('#js-comment-textarea-' + commentId);
    const commentButton = $('#js-comment-button-' + commentId);

    commentLabelArea.hide();
    commentTextArea.show();
    commentButton.show();
  });
});
// コメント編集エリア非表示
$(function () {
  $(document).on("click", ".comment-cancel-button", function () {
    const commentId = $(this).data('cancel-id');
    const commentLabelArea = $('#js-comment-label-' + commentId);
    const commentTextArea = $('#js-comment-textarea-' + commentId);
    const commentButton = $('#js-comment-button-' + commentId);
    const commentError = $('#js-comment-post-error-' + commentId);

    commentLabelArea.show();
    commentTextArea.hide();
    commentButton.hide();
    commentError.hide();
  });
});
// コメント更新ボタン
/*
$(function () {
  $(document).on("click", ".comment-update-button", function () {
    const path = location.pathname;
    const commentId = $(this).data('update-id');
    const textField = $('#js-comment-textarea-' + commentId);
    const body = textField.val();


    $.ajax({
      url: path + '/post_comments/',
      type: 'PATCH',
      data: {
        post_comment: {
          id: commentId,
          comment: body
        }
      }
    })
      .done(function () {
        const commentLabelArea = $('#js-comment-label-' + commentId);
        const commentTextArea = $('#js-comment-textarea-' + commentId);
        const commentButton = $('#js-comment-button-' + commentId);
        const commentError = $('#js-comment-post-error-' + commentId);

        commentLabelArea.show();
        commentLabelArea.text(data.body);
        commentTextArea.hide();
        commentButton.hide();
        commentError.hide();
      })
  });
});
*/
