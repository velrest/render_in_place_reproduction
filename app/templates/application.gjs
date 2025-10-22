import { pageTitle } from 'ember-page-title';
import { WelcomePage } from 'ember-welcome-page';
import PowerSelect from "ember-power-select/components/power-select"
import BasicDropdownWormhole from 'ember-basic-dropdown/components/basic-dropdown-wormhole';

const test = "test"
const options = Array.from(Array.from(Array(100)).keys().map(k=>`test${k}`))
const change = () => {console.log("changed")}
<template>
  <BasicDropdownWormhole />
  <div style="position: fixed; left: 0; top: 0; height: 20px; width: 100vw; background-color:red;"></div>
  <div style="height: 1400px; margin-top: 20px">
    <span>Set your viewport size to 1920x1080. Scroll down to see dropdowns.</span>
    <div style="height: 1000px;">
    </div>
    <div>
    <span> This will render always below even if @verticalPosition="auto" is set. </span>
    <span>With my fix temporarily linked here. Without the relative trigger top/left fix, the renderInPlace dropdown will sometimes render into the bottom even if there is not enough space. For reproduction, this happens at <code>window.scrollY=342</code></span>
      <pre><code>
      triggerLeft += window.scrollX
      triggerTop += window.scrollY
      </code></pre>

      <PowerSelect
        @multiple={{true}}
        @options={{options}}
        @selected="test1"
        @disabled={{false}}
        @allowClear={{true}}
        @preventScroll={{true}}
        @searchEnabled={{false}}
        @renderInPlace={{true}}
        @placeholder="renderInPlace true"
        @onChange={{change}}
        aria-labelledby={{@field.labelId}}
        @verticalPosition="auto"
        as |option|
      >
        {{option}}
      </PowerSelect>
    </div>
    <div>
    <span>This will render based on available space.</span>
      <PowerSelect
        @multiple={{true}}
        @options={{options}}
        @selected="test1"
        @disabled={{false}}
        @allowClear={{true}}
        @preventScroll={{true}}
        @searchEnabled={{false}}
        @placeholder="renderInPlace unset"
        @onChange={{change}}
        aria-labelledby={{@field.labelId}}
        @verticalPosition="auto"
        as |option|
      >
        {{option}}
      </PowerSelect>
    </div>
    <div style="height: 400px;">
    </div>
  </div>
</template>
