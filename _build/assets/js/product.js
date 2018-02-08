import axios from 'axios'

document.querySelectorAll('.js-product-view').forEach(button => {
    button.addEventListener('click', () => {
        // console.log(App.connector_url)
        // console.log(button.dataset.id)

        /*axios.get(
            assets_url + 'action.php', 
            {
                params: {
                    action: 'product/get',
                    id: button.dataset.id
                }
            }
        ).then(response => {
            console.log(response)
        });*/
        axios.get(
            assets_url + 'web/connector.php', 
            {
                params: {
                    action: 'product/quickview',
                    id: button.dataset.id
                }
            }
        ).then(response => {
            console.log(response)
        });
    })
})