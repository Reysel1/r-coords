$(() => {
    window.addEventListener('message', (event) => {
        let v = event.data

        if (v.type == "open") {
            const { x, y, z } = v._charPos;
            const heading = v._charHeading;
            
            $('body').css('display', 'block')

            $('.all').append(` 
                <div class="coords"> <span id="copy"><i class="fa-solid fa-copy"></i></span> <span id="text" > vector3(${x.toFixed(2)}, ${y.toFixed(2)}, ${z.toFixed(2)}) </span> </div>
                <div class="coords">  <span id="copy"><i class="fa-solid fa-copy"></i></span> <span id="text" > vector4(${x.toFixed(2)}, ${y.toFixed(2)}, ${z.toFixed(2)}, ${heading.toFixed(2)}) </span>  </div>
                <div class="coords">  <span id="copy"><i class="fa-solid fa-copy"></i></span> <span id="text" > x = ${x.toFixed(2)}, y = ${y.toFixed(2)}, z = ${z.toFixed(2)} </span>  </div>
                <div class="coords">  <span id="copy"><i class="fa-solid fa-copy"></i></span> <span id="text" > x = ${x.toFixed(2)}, y = ${y.toFixed(2)}, z = ${z.toFixed(2)}, h = ${heading.toFixed(2)} </span>  </div>
                <div class="coords">  <span id="copy"><i class="fa-solid fa-copy"></i></span> <span id="text" > vec3(${x.toFixed(2)}, ${y.toFixed(2)}, ${z.toFixed(2)}) </span>  </div>
                <div class="coords">  <span id="copy"><i class="fa-solid fa-copy"></i></span> <span id="text" > vec4(${x.toFixed(2)}, ${y.toFixed(2)}, ${z.toFixed(2)}, ${heading.toFixed(2)}) </span>  </div>
                

                `) 
        }



        let copy = str => {
            const copytx = document.createElement('textarea');
            copytx.value = str;
            document.body.appendChild(copytx);
            copytx.select();
            document.execCommand('copy');
            document.body.removeChild(copytx);
         };

        $('.coords').click(function () {
            let text = $(this).find('#text').text()
            copy(text)
            console.log(text)
            closeall()
            $.post("https://r-coords/int:noty", JSON.stringify({
                noti: 'Has copiado las cordenadas:' + text,
            }))
            
        })


        document.onkeydown = function (e) {
            if ((e.which == 27)) { 
                closeall()
              }
         }

        function closeall() {
            $.post("https://r-coords/int:close", JSON.stringify('close')); 
            $('.all').empty()
            $('body').css('display', 'none')
        }

    })
})
