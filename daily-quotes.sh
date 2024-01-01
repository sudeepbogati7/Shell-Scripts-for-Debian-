#!/bin/bash

API_KEY='UKBqKHaKlaBpFEuetXqwLw==N4VefW44lZAytRGg'

quote_data=$(curl -s "https://api.api-ninjas.com/v1/quotes?category=life" -H "Authorization: $API_KEY")

quote=$(echo "$quote_data" | jq -r '.[0].quote // .quote')

# Display the quote
echo "Life Quote of the Day:"
echo "$quote"
