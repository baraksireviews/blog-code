<div class='subscription-form-wrapper' data-state='initial'>
    <form action='' class='initialSate subscription-form' onSubmit='handleSubscriptionFormSubmit(event, this)'>
        <input type='email' name='email' required placeholder="הרשם לעדכונים בעזרת אימייל">
        <button type='submit'>הרשם</button>
    </form>

    <div class='successState'>
        <i class="fa fa-check-circle fa-2x"></i>
        <span style='width:20px'></span>
        <span>ההרשמה בוצעה בהצלחה!</span>
    </div>

    <div class='errorState'>
        <i class="fa fa-exclamation-circle fa-2x"></i>
        <span style='width:20px'></span>
        <span>
            ארעה שגיאה בהרשמה, אנא <span style='text-decoration:underline;cursor:pointer' onClick='handleSubscriptionFormSubmitFailure(event, this)'>נסה שנית</span>
        </span>
    </div>
</div>

<script>
    function handleSubscriptionFormSubmit(event, elem) {
        event.preventDefault();

        var email = elem.getElementsByTagName('input')[0].value;

        var x;

        xhr('https://formspree.io/baraksireviews@gmail.com', null, function(err, res) {
            if (err !== null) {
                elem.parentElement.setAttribute('data-state', 'error');
            }
            else {
                elem.parentElement.setAttribute('data-state', 'success');
            }
        },
        { email: email }, x);
    }

    function handleSubscriptionFormSubmitFailure(event, elem) {
        elem.parentElement.parentElement.parentElement.setAttribute('data-state', 'initial');
    }
</script>