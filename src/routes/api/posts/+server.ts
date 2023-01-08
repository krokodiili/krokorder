import { json } from '@sveltejs/kit';

export const GET = async () => {
	const allPosts = await fetchMarkdownPosts();

	const sortedPosts = allPosts.sort((a, b) => {
		return new Date(b.meta.date) - new Date(a.meta.date);
	});

	return json(sortedPosts);
};

export const fetchMarkdownPosts = async () => {
	const allPostFiles = import.meta.glob('/src/content/articles/*.md');
	const iterablePostFiles = Object.entries(allPostFiles);

	const allPosts = await Promise.all(
		iterablePostFiles.map(async ([path, resolver]) => {
			const { metadata } = await resolver();
			const postPath = path.slice(12, -3);

			return {
				meta: metadata,
				path: postPath
			};
		})
	);

	return allPosts;
};
