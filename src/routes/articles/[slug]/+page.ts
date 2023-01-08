export async function load({ params }) {
	console.log(params, 'haha');
	const post = await import(`../../../content/articles/${params.slug}.md`);
	const { title, date } = post.metadata;
	const content = post.default;

	return {
		content,
		title,
		date
	};
}
