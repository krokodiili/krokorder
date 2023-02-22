/** @type {import('tailwindcss').Config} */
module.exports = {
	content: ['./src/**/*.{html,js,svelte,ts}'],
	purge: ['./src/**/*.svelte'],
	mode: 'jit',
	theme: {
		extend: {
			colors: {
				primary: '#AAC200',
				bg: '#111',
				slate: '#1C2027',
				white: '#fff',
				glass: 'rgba(0,0,0,0.4)'
			},
			fontFamily: {
				sans: ['Inconsolata', 'monospace'],
				display: ['Exo', 'monospace']
			}
		}
	},
	plugins: [require('@tailwindcss/typography')]
};
