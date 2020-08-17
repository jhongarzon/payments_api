# Overall

Overall the Backend is pretty solid. Especially taken into consideration the turnaround time. It follows
a lot of best practices and does a good job especially give your background of more .NET than Rails.

Please also see:
- any inline comments prepended with `FEEDBACK:`
- Feedback-FE.md in the front-end repository for feedback on the React app.

## Strengths
- Service Objects using simple_command gem
- JWT gem usage
- Use of Rails credentials (but could include something in README.md about it)
- Cool that it supports currencies!
- Uses Graphiti - we like this library
- Good seed data

## Improvements
- environment variable library (like dotenv-rails for example)
- serve local content over TLS to mirror production/staging better, for more consistent network/security topology
- using UUID instead of integer ID db keys
- ran test suite and got: `131 examples, 70 failures, 30 pending`


# Feedback from Paisa (Front End and Back End both)

## Good:
- Liked the JWT implementation
- Was implemented in almost no time
- Worked as expected
- Easy to run, good instructions 

## Some details:
- UI is broken in some places and could look better without a lot of effort. 
- No navigation history for product detail, product payment, etc.
- Too many responsibilities for this component, it could be implemented with multiple routes https://github.com/jhongarzon/payments_front/blob/c7493ecfc00160ed9a6459363cffc3fb6b9f89e1/src/components/products/show-products.jsx#L36

## Bugs:
- Stock of the product is not updated after the purchase, only the stock movement is created. 
