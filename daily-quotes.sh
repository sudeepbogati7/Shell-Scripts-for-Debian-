#!/bin/bash

quote_data=$(curl -s "https://api.quotable.io/random")

quote=$(echo "$quote_data" | jq -r '.[0].quote // .quote')

# Display the quote
echo "Life Quote of the Day:"
echo "$quote"
