
$url = "<URL FOR ENDPOINT>"
<# 
$key = "<API KEY FOR ENDPOINT>"
$headers = @{
    "Authorization" = "Bearer $key"
}
#>

$body = @{
    "data" = @(
        @{
            "make" = "alfa-romero"
            "fuel-type" = "gas"
            "aspiration" = "std"
            "num-of-doors" = "two"
            "body-style" = "convertible"
            "drive-wheels" = "rwd"
            "engine-location" = "front"
            "wheel-base" = "88.6"
            "length" = "168.8"
            "width" = "64.1"
            "height" = "48.8"
            "curb-weight" = "2548"
            "engine-type" = "dohc"
            "num-of-cylinders" = "four"
            "engine-size" = "140"
            "fuel-system" = "mpfi"
            "bore" = "3.47"
            "stroke" = "2.68"
            "compression-ratio" = "9"
            "horsepower" = "130"
            "peak-rpm" = "5000"
            "city-mpg" = "21"
            "highway-mpg" = "27"
        }
    )
}

$jsonBody = ConvertTo-Json $body

try {
    $response = Invoke-RestMethod -Method POST -ContentType "application/json" -Uri $url -Body $jsonBody # -Headers $headers
} catch {
    Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__
    Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription
}

$predicted_price = ConvertFrom-Json $response
Write-Host "Predicted price for this car: $($predicted_price.result)"-ForegroundColor Green
