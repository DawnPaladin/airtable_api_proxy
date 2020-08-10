$().ready(() => {
    console.log('loaded')
    $.ajax('/v0/foods').then((response, status, jqXHR) => {
        console.log(response.foods);
    });
})
