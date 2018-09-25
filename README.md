# 🧘 reiki
> ReasonML bindings to Yoga Layout.

*Status*: Usable ALPHA. 

Homepage: https://ostera.github.io/reiki

## Installation

```sh
ostera/reactor λ yarn add @ostera/reiki --save
```

And including it in your `bsconfig.json` file too:

```json
{
  // ...
  "suffix": ".bs.js",
  "bs-dependencies": [
    "@ostera/reiki",
  ],
  "warnings": {
    "error" : "+101"
  },
  // ... 
}
```

Now you're good! Make sure to run `bsb -make-world` and check the docs! :)
