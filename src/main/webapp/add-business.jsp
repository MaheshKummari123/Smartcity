<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <meta charset="UTF-8">
        <title>Post Job</title>

        <style>
            body {
                background-color: #0f0f0f;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                font-family: Arial, sans-serif;
            }

            .card:hover {
                background-image: linear-gradient(163deg, #00ff75 0%, #3700ff 100%);
                box-shadow: ;
            }

            .card {

                border-radius: 22px;
                padding: 2px;
            }

            .card2 {
                border-radius: 20px;
            }

            .form {
                display: flex;
                flex-direction: column;
                gap: 12px;
                padding: 32px;
                background-color: #171717;
                border-radius: 20px;
                width: 520px;
            }

            #heading {
                text-align: center;
                color: white;
                font-size: 1.4em;
                margin-bottom: 10px;
            }

            .field {
                display: flex;
                align-items: center;
                gap: 10px;
                padding: 12px;
                border-radius: 12px;
                background-color: #171717;
                box-shadow: inset 2px 5px 10px rgb(5, 5, 5);
            }

            .field.textarea {
                align-items: flex-start;
            }

            .icon {
                color: #aaa;
                font-size: 14px;
            }

            .input-field {
                background: none;
                border: none;
                outline: none;
                width: 100%;
                color: #d3d3d3;
                font-size: 14px;
            }

            textarea.input-field {
                min-height: 70px;
                resize: none;
            }

            select.input-field {
                cursor: pointer;
            }

            .btn {
                display: flex;
                justify-content: center;
                gap: 10px;
                margin-top: 20px;
            }

            .button1,
            .button2,
            .button3 {
                padding: 10px 20px;
                border-radius: 8px;
                border: none;
                background-color: #252525;
                color: white;
                cursor: pointer;
                transition: 0.3s;
            }

            .button1:hover,
            .button2:hover {
                background-color: black;
            }

            .button3 {
                margin-top: 10px;
            }

            .button3:hover {
                background-color: red;
            }
        </style>

    </head>

    <body>

        <div class="card">
            <div class="card2">
                <form class="form" action="addBusiness" method="post">

                    <p id="heading">Add Business</p>

                    <div class="field">
                        <span class="icon"><i class="fa-solid fa-briefcase"></i></span>
                        <input type="text" class="input-field" placeholder="Business Name" name="businessName">
                    </div>

                    <div class="field">
                        <input type="text" class="input-field" placeholder="Category" name="category">
                    </div>

                    <div class="field textarea">
                        <span class="icon"></i></span>
                        <textarea placeholder="Description" name="desc" class="input-field"></textarea>
                    </div>

                    <div class="field">
                        <span class="icon"><i class="fa-solid fa-map-location"></i></span>
                        <input type="text" class="input-field" placeholder="Address" name="address">
                    </div>

                    <div class="field">
                        <span class="icon">📞</span>
                        <input type="text" class="input-field" placeholder="Contact Phone" name="phone">
                    </div>

                    <div class="field">
                        <span class="icon"><i class="fa-regular fa-envelope"></i></span>
                        <input type="text" placeholder="Contact Email" name="email" class="input-field">
                    </div>




                    <div class="field">
                        <span class="icon"><i class="fa-solid fa-link"></i></i></span>
                        <input type="text" name="website" placeholder="Website Link" class="input-field">
                    </div>

                    <div class="field">
                        <input type="text" name="ownerId" placeholder="Owner Id" class="input-field">
                    </div>

                    <div class="field">
                        <span class="icon"><i class="fa-regular fa-star"></i></span>
                        <input type="text" name="rating" placeholder="Business Rating" class="input-field">
                    </div>

                    

                    <div class="btn">
                        <button type="submit" class="button2">Publish</button>
                    </div>

                    <button type="reset" class="button3">Cancel</button>

                </form>
            </div>
        </div>

    </body>

    </html>