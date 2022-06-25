<template>
  <div class="body p-3">
    <output
      class="w-full rounded m-1 text-end lead font-weight-bold text-white bg-vue-dark"
      ><p v-if="showDefaultNom">
        {{ result }}
      </p>
      <p v-else>
        {{ defaultNom || 0 }}
      </p>
    </output>
    <div>
      <ul class="row no-gutter">
        <li
          class="col-3 rounded"
          v-for="(items, index) in calculatorBtn"
          :key="`${index} `"
          @click="outputDigit(items)"
        >
          <div
            class="lead text-white text-center m-1 py-3 rounded bg-vue-dark hover-class"
            :class="{
              'bg-vue-green': [
                'C',
                '*',
                '+',
                '-',
                '/',
                '=',
                '%',
                'Del',
              ].includes(items),
            }"
          >
            {{ items }}
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  result: "",
  name: "calculatorOne",
  props: {},
  data: function () {
    return {
      showDefaultNom: false,
      result: "",
      operator: null,
      calculatorBtn: [
        "C",
        "+",
        "-",
        "*",
        "%",
        "1",
        "2",
        "3",
        "=",
        "4",
        "5",
        "6",
        "Del",
        "7",
        "8",
        "9",
        "0",
        ".",
      ],
      previousDefaultNom: "",
      defaultNom: "",
    };
  },
  methods: {
    outputDigit(items) {
      if (items != "=") {
        this.showDefaultNom = false;
      } else {
        this.showDefaultNom = true;
      }
      if (items === "C") {
        this.defaultNom = "";
      }
      if (items === "Del") {
        let n = this.defaultNom + "";
        n.slice(0, -1);
        console.log(n);
        this.defaultNom = n;
      }
      if (!isNaN(items) || items === ".") {
        this.defaultNom += items + "";
      }
      if (items === "%") {
        this.defaultNom = this.defaultNom / 100 + "%";
      }
      if (["/", "+", "-", "*"].includes(items)) {
        this.operator = items;
        this.previousDefaultNom = this.defaultNom;
        this.defaultNom = "";
      }
      if (items === "=") {
        if (
          this.previousDefaultNom != null &&
          this.operator != null &&
          this.defaultNom != null
        ) {
          this.result = eval(
            this.previousDefaultNom + this.operator + this.defaultNom
          );

          this.defaultNom = this.result;

          this.operator = null;
        } else {
          this.result = "";
        }
      }
    },
  },
};
</script>

<style scoped>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
.body {
  max-width: 400px;
  margin: 50px auto;
  background: #234;
}
li {
  list-style: none;
  cursor: pointer;
}
.bg-vue-dark {
  background: #31475e;
}
.hover-class:hover {
  cursor: pointer;
  background: #3d5875;
}
.bg-vue-green {
  background: #3fb984;
}
</style>
